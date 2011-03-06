package Damavik;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
	my $self = shift;

	# Documentation browser under "/perldoc" (this plugin requires Perl 5.10)
	$self->plugin('pod_renderer');

	# Config loading
	# Загружаем настройки
	$self->plugin('json_config');
	my $config = $self->stash('config');
	
	$self->secret($config->{secret});
	
	# Validator loading
	# Загружаем валидатор
    $self->plugin('validator');

	# Routes
	my $r = $self->routes;

	# Normal route to controller
	$r->route('/welcome')->to('example#welcome');
	$r->route('/entrance')->to('entrance#door');
	$r->route('/entrance/check')->to('entrance#check');

}

1;
