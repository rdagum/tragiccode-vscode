require 'spec_helper'

describe 'vscode::config' do
  context 'with default values for all parameters' do

    let(:facts) {{
      :appdata => 'C:\Users\tragiccode\AppData\Roaming', 
    }}
    it { should contain_class('vscode') }
    it { should contain_class('vscode::config') }

    it { should contain_file('C:\Users\tragiccode\AppData\Roaming\Code\User').with({
        :ensure => 'directory',
    })}

    it { should contain_file('C:\Users\tragiccode\AppData\Roaming\Code').with({
        :ensure => 'directory',
    })}

    it { should contain_file('C:\Users\tragiccode\AppData\Roaming\Code\User\settings.json').with({
        :ensure => 'file',
    })}


    it { should contain_file('C:\Users\tragiccode\AppData\Roaming\Code\User\settings.json').with({
        :ensure => 'file',
    }).with_content(/"workbench\.iconTheme": "vs-seti"/)}


  end
end
