pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''export PATH="/opt/rbenv/bin:/opt/rbenv/shims:$PATH"
eval "$(rbenv init -)"
export RBENV_ROOT=/opt/rbenv

USE_SYSTEM_GECODE=1 bundle install --path vender/bundle --binstubs

bundle exec omnibus build mcollective --override append_timestamp:false'''
      }
    }
  }
}