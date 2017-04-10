#!perl
# vim: softtabstop=4 tabstop=4 shiftwidth=4 ft=perl expandtab smarttab
# ABSTRACT: Perl API for HashiCorp's Vault (System)

# See also https://github.com/hashicorp/vault-ruby
# And https://github.com/ianunruh/hvac
# And https://www.vaultproject.io/api/index.html

package WebService::HashiCorp::Vault::Sys;

use Moo;
# VERSION
use namespace::clean;

extends 'WebService::HashiCorp::Vault::Base';

has '+mount' => ( is => 'ro', default => 'system' );

sub sys {
    my $self = shift;
    my $name = shift;
    my %args = @_;

    # TODO both should return an object

    # this is a save (put)
    if (keys %args) {
        return $self->put( $self->_mkuri($name), \%args )
    }
    # this is a get
    else {
        return $self->get( $self->_mkuri($name) )
    }
}


1;