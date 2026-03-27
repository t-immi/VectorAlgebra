# frozen_string_literal: true
require_relative "test_helper"

class Vector3DTest < Minitest::Test
  # cross (правый базис)
  def test_cross_product_right_orientation
    v1 = VectorAlgebra::Vector3D.new(1, 0, 0)
    v2 = VectorAlgebra::Vector3D.new(0, 1, 0)

    result = v1.cross(v2)

    assert_equal [0.0, 0.0, 1.0], result.to_a
  end

  # cross (левый базис)
  def test_cross_product_left_orientation
    v1 = VectorAlgebra::Vector3D.new(1, 0, 0)
    v2 = VectorAlgebra::Vector3D.new(0, 1, 0)

    result = v1.cross(v2, orientation: :left)

    assert_equal [0.0, 0.0, -1.0], result.to_a
  end

  def test_cross_parallel_vectors
    v1 = VectorAlgebra::Vector3D.new(1, 1, 1)
    v2 = VectorAlgebra::Vector3D.new(2, 2, 2)

    result = v1.cross(v2)

    assert_equal [0.0, 0.0, 0.0], result.to_a
  end

  def test_cross_dimension_error
    v1 = VectorAlgebra::Vector3D.new(1, 2, 3)
    v2 = VectorAlgebra::Vector.new(1, 2)

    assert_raises(VectorAlgebra::DimensionError) do
      v1.cross(v2)
    end
  end

  def test_xyz_accessor
    v = VectorAlgebra::Vector3D.new(5, 6, 7)

    assert_equal 5.0, v.x
    assert_equal 6.0, v.y
    assert_equal 7.0, v.z
  end
end
