require_relative '../../spec_helper'

describe 'File::Name' do

  describe '#get_uniq' do
    before(:all) do
      @file_list = ['picture1.jpg', 'picture-1.png', 'picture-2.png', 'picture-5.png', 'picture.png', 'picture-1.jpg', ]
    end
    context 'attributes are valid' do
      it 'should generate file with uniq number appended' do
        expect(File::Name.get_uniq(@file_list,'picture.png')).to eq('picture-6.png')
      end

      it 'should return the same filename because passed filename does not exist' do
        expect(File::Name.get_uniq(@file_list,'picture.jpg')).to eq('picture.jpg')
      end
    end

    context 'invalid attributes are passed' do
      it 'should return TypeError because filelist is not an array' do
        expect{File::Name.get_uniq('not-an-array','picture.png')}.to raise_error(TypeError)
      end

      it 'should return ArgumentError because filename is in the wrong format' do
        expect{File::Name.get_uniq(@file_list,'picture')}.to raise_error(ArgumentError)
      end
    end

    context 'nil is passed' do
      it 'should return a TypeError error because file_list is nil' do
        expect{File::Name.get_uniq(nil,'picture.png')}.to raise_error(TypeError)
      end

      it 'should return ArgumentError because filename is nil' do
        expect{File::Name.get_uniq(@file_list,nil)}.to raise_error(ArgumentError)
      end

      it 'should return a TypeError error because both are nil' do
        expect{File::Name.get_uniq(nil,'picture.png')}.to raise_error(TypeError)
      end
    end
  end
end