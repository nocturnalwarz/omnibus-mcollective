name "mcollective-filemgr-agent"
default_version "1.1.0"

dependency "mcollective"

version("1.1.0") { source md5: 'afcd5c778cabb40b5aa42496eb5862f9' }

source url: "https://github.com/puppetlabs/mcollective-filemgr-agent/archive/#{version}.tar.gz"

relative_path = "mcollective-filemgr-agent-#{version}"

build do
  block do
    %w(agent application).each do |dir|
      FileUtils.cp_r File.join(project_dir, "mcollective-filemgr-agent-#{version}", dir), ::File.join(install_dir, "plugins", "mcollective")
    end
  end
end