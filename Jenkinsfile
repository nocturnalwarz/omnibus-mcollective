pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''export PATH="/opt/rbenv/bin:/opt/rbenv/shims:$PATH"
eval "$(rbenv init -)"
export RBENV_ROOT=/opt/rbenv

bundle install --binstubs
bin/omnibus build omnibus-mcollective'''
      }
    }
  }
}