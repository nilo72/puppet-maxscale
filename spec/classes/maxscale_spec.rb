require 'spec_helper'

describe 'maxscale' do

  let(:facts) { {
      :concat_basedir             => '/tmp',
      :osfamily                   => 'Debian',
      :operatingsystem            => 'Debian',
      :lsbdistid                  => 'Debian',
      :operatingsystemrelease     => '8',
      :fqdn                       => 'testhost.example.org',
  }}

  let(:params) { {

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


    describe 'maxscale::install' do

      it 'use apt source' do
        should contain_apt__source('maxscale')
      end

      it 'installs packages' do
        should contain_package('maxscale')
        should contain_package('maxscale').with_ensure('latest')
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