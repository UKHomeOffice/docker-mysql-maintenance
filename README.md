# Docker MySQL Maintenance Container

This is a one shot docker container that change your MySQL root password from the default. Optionally it can also run 
scripts and SQL after it has done this to do basic DB initialisation.

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

Provide no parameters and the container will ensure the root password is set correctly and run any SQL or shell scripts 
in the directory and exit

```shell
docker run quay.io/ukhomeofficedigital/mysql-maintenance:v0.1.0 parameters
```

Provide any other parameter and it'll execute it

```shell
docker run quay.io/ukhomeofficedigital/mysql-maintenance:v0.1.0 echo hello
```

will echo `hello`

#### Environment Variables

* `MYSQL_HOST` - Host of MySQL server
* `MYSQL_PORT` - MySQL Port (defaults to `3306`)
* `DEFAULT_PW` - Default password your ERBs are started up with
* `MYSQL_PASSWORD_PATH` - Path to file with new password in

#### Useful File Locations

* `/docker-entrypoint-initdb.d/*.sh` - Will be executed. MySQL password and user root is already set.
* `/docker-entrypoint-initdb.d/*.sql` - Will be ran as root mysql user

## Built With

* [ukhomeofficedigital/mysql v0.5.0](https://github.com/UKHomeOffice/docker-mysql/releases/tag/v0.5.0)

## Find Us

* [GitHub](https://github.com/UKHomeOffice/docker-mysql-maintenance)
* [Quay.io](https://quay.io/repository/ukhomeofficedigital/mysql-maintenance)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the 
[tags on this repository](https://github.com/UKHomeOffice/docker-mysql-maintenance/tags). 

## Authors

See the list of [contributors](https://github.com/UKHomeOffice/docker-mysql-maintenance/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
