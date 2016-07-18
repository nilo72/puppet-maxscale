require 'spec_helper'

describe 'maxscale' do

  let(:facts) { {
      :concat_basedir             => '/tmp',
      :osfamily                   => 'Debian',
      :operatingsystem            => 'Debian',
      :lsbdistid                  => 'Debian',
      :lsbdistcodename            => 'jessie',
      :operatingsystemrelease     => '8',
      :fqdn                       => 'testhost.example.org',
  }}

  let(:params) { {
      :apt_url          => 'source.example.com',
  }}

  context 'with default settings' do
    it 'Compile' do
      should compile
    end

    it 'check defaults' do
      should contain_class('maxscale')
      should contain_class('maxscale::params')
    end

    it 'Steps for working' do
      should contain_anchor('maxscale::begin')
      should contain_anchor('maxscale::end')
    end

    it 'Used classes' do
      should contain_class('maxscale::install')
      should contain_class('maxscale::config')
      should contain_class('maxscale::service')
    end

=begin
    it 'maxscale configfile settings' do
      should contain_ini_setting('maxscale router').with_section('OwncloudService')
      should contain_ini_setting('maxscale router').with_setting('router')
      should contain_ini_setting('maxscale router').with_value('readconnroute')
      should contain_ini_setting('maxscale service type').with_section('OwncloudService')
      should contain_ini_setting('maxscale service type').with_setting('type')
      should contain_ini_setting('maxscale service type').with_value('service')
      should contain_ini_setting('maxscale servers').with_section('OwncloudService')
      should contain_ini_setting('maxscale servers').with_setting('servers')
      should contain_ini_setting('maxscale servers').with_value('server1,server2,server3')
      should contain_ini_setting('maxscale threads').with_setting('threads')
      should contain_ini_setting('maxscale threads').with_section('MaxScale')
      should contain_ini_setting('maxscale threads').with_value('1')
    end
=end

    describe 'maxscale::install' do

      it 'use apt source' do
        should contain_apt__source('maxscale')
      end

      it 'installs packages' do
        should contain_package('maxscale')
        should contain_package('maxscale').with_ensure('present')
      end
    end

    describe 'maxscale::config' do
      it 'contain files' do
      end
    end

    describe 'maxscale::service' do

    end
  end
end #describe 'maxscale'