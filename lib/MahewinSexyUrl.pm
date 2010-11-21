package MahewinSexyUrl;
use Dancer ':syntax';
use Dancer::Plugin::DBIC;
use Data::Uniqid qw ( luniqid );

our $VERSION = '0.3';

get '/' => sub {
    template 'index';
};

post '/' => sub {
    my $long_url = create_sexy_url(params->{sexy_url});

    if ( ! $long_url ) {
        
        my $search_long_url = schema('db')->resultset('Url')->find({
            long_url => params->{sexy_url}, 
        });
        return template 'index.tt', { 
            message  => "This long url exist, and whouah! It's very beautiful",
            url      => "$search_long_url->{_column_data}->{sexy_url}"
        };
    }

    return template 'index.tt', {
        message => "Whouah ! This a very beautiful url :)",
        url     => "$long_url"
    };
};

get '/get_long_url' => sub {
    template 'long_url.tt';
};

post '/get_long_url' => sub {
    my $sexy_url = get_long_url(params->{long_url});

    if ( ! $sexy_url ) {
        return template 'long_url.tt', {
            message => "This long url is not here."
        };
    }

    return template 'long_url.tt', {
        message => "The long url is",
        url     => "$sexy_url"
    };
};

get '/:sexy_url' => sub {
    my $search_sexy_url = schema('db')->resultset('Url')->find({
        sexy_url => params->{sexy_url}, 
    });
     
    if ( ! $search_sexy_url ) {
        return send_error("This sexy url not exist, sorry", 404);
    }
    
    redirect $search_sexy_url->{_column_data}->{long_url};
};

=head1 create_sexy_url

This function is to create a sexy_url. Use luniqid from Data::Uniqid.

=cut

sub create_sexy_url {
    my ( $long_url ) = @_;

    my $search_long_url = schema('db')->resultset('Url')->find({
        long_url => $long_url, 
    });

    if ( $search_long_url ) {
        return 0;
    }
    
    my $id       = luniqid;
    my $size     = 14 + int(rand(3));
    my $sexy_url = substr($id, $size);

    my $search_sexy_url = schema('db')->resultset('Url')->find({
        sexy_url => $sexy_url, 
    });

    $sexy_url .= 1 if ( $search_sexy_url );

    schema('db')->resultset('Url')->create({
        long_url => $long_url,
        sexy_url => $sexy_url
    });

    return $sexy_url;
}

=head1 get_long_url

This function give you a long_url of the sexy_url.

=cut

sub get_long_url {
    my ( $sexy_url ) = @_;

    my $search_sexy_url = schema('db')->resultset('Url')->find({
        sexy_url => $sexy_url, 
    });

    if ( ! $search_sexy_url ) {
        return 0;
    }
    
    return $search_sexy_url->{_column_data}->{long_url}; 
}

=head1 AUTHOR 

Natal Ngétal

=cut

true;
