require_relative '../../spec_helper'

describe 'Array::Manipulator' do

	before do
		@arr = [1,1,1,2,2,3,4,5,6,7,'string','nonstring','string']
	end

	describe '#dup' do

		context 'success' do
			it 'should return dups' do
				expect(Array::Manipulator.dup(@arr)).to eq([1,2,'string'])
			end
		end

		context 'array is nil' do
			it 'should return 0' do
				expect(Array::Manipulator.dup(nil)).to eq(0)
			end
		end

		context 'array is empty' do
			it 'should return 0' do
				expect(Array::Manipulator.dup([])).to eq(0)
			end
		end

	end

	describe '#uniq' do

		context 'success' do
			it 'should return dups' do
				expect(Array::Manipulator.uniq(@arr)).to eq([3,4,5,6,7,'nonstring'])
			end
		end

		context 'array is nil' do
			it 'should return 0' do
				expect(Array::Manipulator.uniq(nil)).to eq(0)
			end
		end

		context 'array is empty' do
			it 'should return 0' do
				expect(Array::Manipulator.uniq([])).to eq(0)
			end
		end

	end

	describe '#uniq' do

		context 'success' do
			it 'should return dups' do
				expect(Array::Manipulator.number_of_occurencies(@arr,1)).to eq(3)
			end
		end

		context 'array is nil' do
			it 'should return 0' do
				expect(Array::Manipulator.number_of_occurencies(nil,1)).to eq(0)
			end
		end

		context 'array is empty' do
			it 'should return 0' do
				expect(Array::Manipulator.number_of_occurencies([],1)).to eq(0)
			end
		end

	end
end