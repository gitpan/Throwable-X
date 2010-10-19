package Throwable::X::WithIdent;
BEGIN {
  $Throwable::X::WithIdent::VERSION = '0.002';
}
use Moose::Role;
# ABSTRACT: a thing with an ident attribute


use Throwable::X::Types;

use namespace::clean -except => 'meta';

has ident => (
  is  => 'ro',
  isa => 'Throwable::X::_Ident',
  required => 1,
);

1;

__END__
=pod

=head1 NAME

Throwable::X::WithIdent - a thing with an ident attribute

=head1 VERSION

version 0.002

=head1 DESCRIPTION

This is an incredibly simple role.  It adds a required C<ident> attribute that
stores a simple string, meant to identify exceptions.

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

