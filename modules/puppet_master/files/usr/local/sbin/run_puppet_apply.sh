#!/bin/sh

rem_repo=ssh://puppet.puppetclass.taoslab.com/srv/gitrepos/puppet
repodir=/etc/puppet/repo
moduledir=${repodir}/modules
manifest=${repodir}/manifests/site.pp

run_git() {
  sudo -u puppet -H git "$@"
}

if [ -d ${repodir} ] ; then
  if [ ! -d ${repodir}/.git ] ; then
    run_git clone ${rem_repo} ${repodir}
  else
    (cd ${repodir} && run_git pull -X theirs)
  fi

  if [ -d ${moduledir} ] && [ -f ${manifest} ] ; then
    puppet apply --modulepath ${moduledir} ${manifest}
  fi
fi

