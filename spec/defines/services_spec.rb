require 'spec_helper'

describe 'maxscale::services', :type => :define do
  let :pre_condition do
      'class { "maxscale": configfile => "/etc/maxscale.cnf", apt_url => "source.example.com" }'
  end

  let :title do
    'maxscale services test'
  end

  let :default_params do
    {
      :name        => 'test',
      :type        => 'test',
      :router      => 'test',
      :servers     => 'test',
      :sectionname => 'OcService',
    }
  end


  describe 'simple test' do
    context "on Debian based systems" do
      let :default_facts do
        {
            :concat_basedir             => '/tmp',
            :osfamily                   => 'Debian',
            :operatingsystem            => 'Debian',
            :lsbdistid                  => 'Debian',
            :lsbdistcodename            => 'jessie',
            :operatingsystemrelease     => '8',
            :fqdn                       => 'testhost.example.org',
        }
      end
      let :params do default_params end
      let :facts do default_facts end
      it { is_expected.to contain_class('maxscale') }
      it { is_expected.to contain_class('maxscale::config') }
      it { is_expected.to contain_ini_setting('service_type').with_section('OcService')}
      it { is_expected.to contain_ini_setting('service_router').with_path('/etc/maxscale.cnf')}
    end
  end
end