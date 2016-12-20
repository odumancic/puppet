node {
  deleteDir()
  checkout scm
  echo 'beginnning workflow...'

  stage 'prepare gems'
  sh '''#!/bin/bash
#  source ~/.rvm/scripts/rvm
  bundle install --path=.bundle/gems/
  '''

  stage 'syntax testing'
  sh '''#!/bin/bash
#  source ~/.rvm/scripts/rvm
  bundle exec puppet parser validate manifests/
  '''

  stage 'lint testing'
  sh '''#!/bin/bash
#  source ~/.rvm/scripts/rvm
#  bundle exec bundle exec puppet-lint --no-autoloader_layout-check */*/*.pp
  '''

  stage 'rspec testing'
  sh '''#!/bin/bash
#  source ~/.rvm/scripts/rvm
  bundle exec rake spec
  '''

  stage 'smoke testing'
  sh '''#!/bin/bash
#  source ~/.rvm/scripts/rvm
  bundle exec rake spec_prep
  puppet apply ./ --noop
  '''

  stage 'deploy'
  echo 'deploy to puppet masters'
}
