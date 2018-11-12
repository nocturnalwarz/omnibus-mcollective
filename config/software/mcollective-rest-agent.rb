name "mcollective-rest-agent"
default_version "0.0.2"

dependency "mcollective"

version("0.0.1") { source md5: '6a5b410c7e6568fbc0ad68bedeef716a' }
version("0.0.2") { source md5: '9703623aa9376e74316ba12b2487bf52' }

source url: "https://github.com/nocturnalwarz/mcollective-rest/archive/#{version}.tar.gz"

relative_path = "mcollective-rest-#{version}"

build do
  block do
    %w(agent).each do |dir|
      FileUtils.cp_r File.join(project_dir, "mcollective-rest-#{version}", dir), ::File.join(install_dir, "plugins", "mcollective")
    end
  end
end