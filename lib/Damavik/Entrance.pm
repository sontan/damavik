package Damavik::Entrance;
use Mojo::Base 'Mojolicious::Controller';

# Render auth template
# Рисуем шаблон авторизации
sub door {
	my $self = shift;

	$self->redirect_to('index') if $self->session->{owner};

	# Render template "example/welcome.html.ep" with message
	$self->render(message => 'Welcome to the Mojolicious Web Framework!');
}


# Check owners password
# Проверяем пароль хозяина
sub check {
	my $self = shift;

	# Если логин и пароль совпадают
	if ($self->req->param('username') eq $self->stash('config')->{'username'} && 
		$self->req->param('password') eq $self->stash('config')->{'password'} ) 
	{
		# Записываем в сессию
        $self->session(owner => 1);

		# Перенаправляем на главную
		return $self->redirect_to('index');
	}
	else
	{
		# Перенаправляем обратно к двери
		return $self->redirect_to('entrance');
	}
}

1;
