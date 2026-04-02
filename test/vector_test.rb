# frozen_string_literal: true

require_relative "test_helper"

class VectorTest < Minitest::Test
  def test_initialize_success
    v = VectorAlgebra::Vector.new(1, 2, 3)

    assert_equal [1.0, 2.0, 3.0], v.to_a
  end

  def test_initialize_empty_error
    assert_raises(ArgumentError) do
      VectorAlgebra::Vector.new
    end
  end

  def test_dimension
    v = VectorAlgebra::Vector.new(1, 2, 3)

    assert_equal 3, v.dimension
  end

  def test_index_access_success
    v = VectorAlgebra::Vector.new(10, 20, 30)

    assert_equal 20.0, v[1]
  end

  def test_index_access_index_error
    v = VectorAlgebra::Vector.new(1, 2)

    assert_raises(IndexError) { v[10] }
  end

  def test_to_a
    v = VectorAlgebra::Vector.new(5, 6)

    assert_equal [5.0, 6.0], v.to_a
  end

  def test_this_plus_other_success
    v1 = VectorAlgebra::Vector.new(1, 2)
    v2 = VectorAlgebra::Vector.new(3, 4)

    assert_equal [4.0, 6.0], (v1 + v2).to_a
  end

  def test_this_plus_other_error
    v1 = VectorAlgebra::Vector.new(1, 2)
    v2 = VectorAlgebra::Vector.new(1, 2, 3)

    assert_raises(VectorAlgebra::DimensionError) { v1 + v2 }
  end

  def test_this_minus_other_success
    v1 = VectorAlgebra::Vector.new(5, 5)
    v2 = VectorAlgebra::Vector.new(2, 3)

    assert_equal [3.0, 2.0], (v1 - v2).to_a
  end

  def test_this_minus_other_error
    v1 = VectorAlgebra::Vector.new(1, 2)
    v2 = VectorAlgebra::Vector.new(1)

    assert_raises(VectorAlgebra::DimensionError) { v1 - v2 }
  end

  def test_scalar_multiplication_success
    v = VectorAlgebra::Vector.new(1, 2, 3)

    assert_equal [2.0, 4.0, 6.0], (v * 2).to_a
  end

  def test_scalar_multiplication_error
    v = VectorAlgebra::Vector.new(1, 2)

    assert_raises(TypeError) { v * nil }
  end

  def test_dot_product_success
    v1 = VectorAlgebra::Vector.new(1, 2, 3)
    v2 = VectorAlgebra::Vector.new(4, 5, 6)

    assert_equal 32, v1.dot(v2)
  end

  def test_dot_product_error
    v1 = VectorAlgebra::Vector.new(1, 2)
    v2 = VectorAlgebra::Vector.new(1, 2, 3)

    assert_raises(VectorAlgebra::DimensionError) { v1.dot(v2) }
  end

  def test_norm
    v = VectorAlgebra::Vector.new(3, 4)

    assert_equal 5.0, v.norm
  end

  def test_normalize_success
    v = VectorAlgebra::Vector.new(3, 0)
    result = v.normalize

    assert_in_delta 1.0, result.norm, 0.0001
  end

  def test_normalize_error
    v = VectorAlgebra::Vector.new(0, 0)

    assert_raises(VectorAlgebra::ZeroVectorError) { v.normalize }
  end

  def test_angle_with_success
    v1 = VectorAlgebra::Vector.new(1, 0)
    v2 = VectorAlgebra::Vector.new(0, 1)

    assert_equal Math::PI / 2, v1.angle_with(v2)
  end

  def test_angle_with_error
    v1 = VectorAlgebra::Vector.new(1, 0)
    v2 = VectorAlgebra::Vector.new(1, 0, 0)

    assert_raises(VectorAlgebra::DimensionError) { v1.angle_with(v2) }
  end

  def test_project_onto_success
    v1 = VectorAlgebra::Vector.new(3, 4)
    v2 = VectorAlgebra::Vector.new(1, 0)

    assert_equal [3.0, 0.0], v1.project_onto(v2).to_a
  end

  def test_project_onto_zero_vector_error
    v1 = VectorAlgebra::Vector.new(1, 2)
    v2 = VectorAlgebra::Vector.new(0, 0)

    assert_raises(VectorAlgebra::ZeroVectorError) { v1.project_onto(v2) }
  end

  def test_project_onto_dimension_error
    v1 = VectorAlgebra::Vector.new(1, 2)
    v2 = VectorAlgebra::Vector.new(0, 5, 3)

    assert_raises(VectorAlgebra::DimensionError) { v1.project_onto(v2) }
  end

  def test_parallel_success
    v1 = VectorAlgebra::Vector.new(2, 2)
    v2 = VectorAlgebra::Vector.new(1, 1)

    assert_equal true, v1.parallel?(v2)
  end

  def test_parallel_error
    v1 = VectorAlgebra::Vector.new(0, 0)
    v2 = VectorAlgebra::Vector.new(1, 1)

    assert_raises(VectorAlgebra::ZeroVectorError) { v1.parallel?(v2) }
  end

  def test_orthogonal_success
    v1 = VectorAlgebra::Vector.new(1, 0)
    v2 = VectorAlgebra::Vector.new(0, 1)

    assert_equal true, v1.orthogonal?(v2)
  end

  def test_orthogonal_error
    v1 = VectorAlgebra::Vector.new(1, 0)
    v2 = VectorAlgebra::Vector.new(1, 0, 0)

    assert_raises(VectorAlgebra::DimensionError) { v1.orthogonal?(v2) }
  end
end
