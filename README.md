# STORE APP

A simple ruby on rails web application which provides both admin and end user functionalities for a quiz application. Admins can manage quizzes and end user can take quizzes.


## Developer Documentation

### Requirements

1. Docker
2. Docker Compose
3. An editor of your choice (VS Code, Sublime, Atom, etc)

### Clone Repository

```
git clone https://github.com/avinashupadhya99/Quiz-App.git
```

> *Note:* The above command clones over HTTP anonymously. If you have Github account and configured SSH keys then you must clone over SSH to push changes to your forked repository.

### Setting up Development Environment

Create a file named `.env` in source root with the following contents

```
RAILS_ENV=development

MYSQL_SERVER=mysqldb
MYSQL_DATABASE=quizdb
MYSQL_USERNAME=root
MYSQL_PASSWORD=quizdbpassword

```

Create a file named `.env.mysql` in source root with the following content

```
MYSQL_ROOT_PASSWORD=quizdbpassword
```

Start the application server and MySQL using the command-

```
docker-compose up
```

This will build the docker image based on `Dockerfile` and bring up

1. MySQL Server
2. Rails Application Server (in Development Mode)

Once both the containers are running, point your browser to `http://localhost:8800`.

