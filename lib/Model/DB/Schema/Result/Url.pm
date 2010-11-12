package Model::DB::Schema::Result::Url;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Model::DB::Schema::Result::Url

=cut

__PACKAGE__->table("url");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 long_url

  data_type: 'varchar'
  is_nullable: 0
  size: 250

=head2 sexy_url

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "long_url",
  { data_type => "varchar", is_nullable => 0, size => 250 },
  "sexy_url",
  { data_type => "varchar", is_nullable => 0, size => 30 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-11-11 18:16:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cp9zO3rdrwmp6DxHnPC1+Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
