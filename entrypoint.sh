#!/usr/bin/env sh
set -eu

# Environment Variable
# * User name and password is reading in bellow while loop by using eval.
AUTH_ACCESS_WRITE=${AUTH_ACCESS_WRITE-true}
REPOSITORY_NAME=${REPOSITORY_NAME-project-in-svn}

# Constant
REPO_DIR=/var/opt/svn/"${REPOSITORY_NAME}"
REPO_DIR_DEFAULT=/var/opt/svn/project-in-svn
PATH_SVN_SERVE_CONF="$REPO_DIR"/conf/svnserve.conf
PATH_SVN_PASSWD="$REPO_DIR"/conf/passwd

if [ "${REPO_DIR}" != "${REPO_DIR_DEFAULT}" ]; then
  mv "${REPO_DIR_DEFAULT}" "${REPO_DIR}"
fi

if [ "${AUTH_ACCESS_WRITE}" = 'true' ]; then
  sed -i 's/#\sauth-access\s=\swrite/auth-access = write/' "${PATH_SVN_SERVE_CONF}"
fi

sed -i 's/#\spassword-db\s=\spasswd/password-db = passwd/' "${PATH_SVN_SERVE_CONF}"

index=1
while :
do
  eval "user_name=\${USER_${index}_NAME-}"
  # shellcheck disable=SC2154
  if [ "${user_name}" = '' ]; then
    break
  fi
  eval "user_pass=\${USER_${index}_PASS-}"
  # shellcheck disable=SC2154
  echo "${user_name} = ${user_pass}" >> "${PATH_SVN_PASSWD}"
  index=$((index + 1))
done

exec "${@}"
