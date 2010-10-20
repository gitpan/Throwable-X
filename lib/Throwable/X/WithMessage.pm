package Throwable::X::WithMessage;
BEGIN {
  $Throwable::X::WithMessage::VERSION = '0.003';
}
use Moose::Role;
# ABSTRACT: a thing with a message method


use namespace::clean -except => 'meta';

requires 'message';

1;

__END__
=pod

=head1 NAME

Throwable::X::WithMessage - a thing with a message method

=head1 VERSION

version 0.003

=head1 DESCRIPTION

This is another extremely simple role.  A class that includes
Throwable::X::WithMessage is promising to provide a C<message> method that
returns a string describing the exception.  It does I<not> provide any actual
behavior.

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

