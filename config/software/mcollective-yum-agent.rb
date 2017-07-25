name "mcollective-yum-agent"
default_version "0.4.1"

dependency "mcollective"

version("0.4.1") { source md5: 'df0311474be3e96b295d7dd576af931b' }

source url: "https://github.com/powellnathanj/mcollective-yum-agent/archive/v#{version}.tar.gz"

relative_path = "mcollective-yum-agent-#{version}"

build do
  block do
    %w(agent application).each do |dir|
      FileUtils.cp_r File.join(project_dir, "mcollective-yum-agent-#{version}", dir), ::File.join(install_dir, "plugins", "mcollective")
    end
  end
end