package Throwable::X::WithTags;
BEGIN {
  $Throwable::X::WithTags::VERSION = '0.004';
}
use Moose::Role;
# ABSTRACT: a thing with a list of tags

use namespace::clean -except => 'meta';

sub has_tag {
  my ($self, $tag) = @_;

  $_ eq $tag && return 1 for $self->tags;

  return;
}

sub tags {
  my ($self) = @_;

  # Poor man's uniq:
  my %tags = map {; $_ => 1 }
             (@{ $self->_default_tags }, @{ $self->_instance_tags });

  return wantarray ? keys %tags : (keys %tags)[0];
}

has instance_tags => (
  is     => 'ro',
  isa    => 'ArrayRef[Throwable::X::_Tag]',
  reader => '_instance_tags',
  init_arg => 'tags',
  default  => sub { [] },
);

has _default_tags => (
  is      => 'ro',
  builder => '_build_default_tags',
);

sub _build_default_tags {
  # This code stolen happily from Moose::Object::BUILDALL -- rjbs, 2010-10-18

  # NOTE: we ask Perl if we even need to do this first, to avoid extra meta
  # level calls
  return [] unless $_[0]->can('x_tags');

  my @tags;

  my ($self, $params) = @_;
  foreach my $method (
    reverse Class::MOP::class_of($self)->find_all_methods_by_name('x_tags')
  ) {
    push @tags, $method->{code}->execute($self, $params);
  }

  return \@tags;
}

1;

__END__
=pod

=head1 NAME

Throwable::X::WithTags - a thing with a list of tags

=head1 VERSION

version 0.004

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
