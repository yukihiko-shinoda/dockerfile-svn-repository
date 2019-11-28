# What is SVN Repository?

This image is for SVN service based on [garethflowers/svn-server](https://hub.docker.com/r/garethflowers/svn-server/)
with pre-created first repository.

This image is intended to run by orchestration tool like Docker Compose.

# How to use this image

It follows [garethflowers/svn-server](https://hub.docker.com/r/garethflowers/svn-server/).

## Environment Variables

Additionally, we can use following environment variable:

### ```AUTH_ACCESS_WRITE```

If true, enable read and write access for authenticated users to the repository.
(default: ```true```)

### ```REPOSITORY_NAME```

First pre-created repository's name.(default: ```project-in-svn```)

### ```USER_x_NAME```

User name to authenticate for repository.
We can define multiple users like ```USER_1_NAME```, ```USER_2_NAME```, ...
Don't skip number or the number after that will not be read.

### ```USER_x_PASS```

User password to authenticate for repository.
We can define multiple users like ```USER_1_PASS```, ```USER_2_PASS```, ...
This variables will be pair with ```USER_x_NAME``` which has same number.
