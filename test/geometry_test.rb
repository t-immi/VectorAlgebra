# frozen_string_literal: true
require_relative "test_helper"

class GeometryTest < Minitest::Test
  def test_distance_success
    a = VectorAlgebra::Vector.new(0, 0)
    b = VectorAlgebra::Vector.new(3, 4)

    assert_equal 5.0, VectorAlgebra::Geometry.distance(a, b)
  end

  def test_distance_dimension_error
    a = VectorAlgebra::Vector.new(1, 2)
    b = VectorAlgebra::Vector.new(1, 2, 3)

    assert_raises(VectorAlgebra::DimensionError) do
      VectorAlgebra::Geometry.distance(a, b)
    end
  end

  def test_parallelogram_area_3d_success
    a = VectorAlgebra::Vector3D.new(1, 0, 0)
    b = VectorAlgebra::Vector3D.new(0, 1, 0)

    assert_equal 1.0, VectorAlgebra::Geometry.parallelogram_area(a, b)
  end

  def test_parallelogram_area_2d_success
    a = VectorAlgebra::Vector2D.new(1, 2)
    b = VectorAlgebra::Vector2D.new(3, 4)

    assert_equal 2.0, VectorAlgebra::Geometry.parallelogram_area(a, b)
  end

  def test_parallelogram_area_dimension_error
    a = VectorAlgebra::Vector.new(1, 2, 3, 4)
    b = VectorAlgebra::Vector.new(-1, -2, -3, -4)

    assert_raises(VectorAlgebra::DimensionError) do
      VectorAlgebra::Geometry.parallelogram_area(a, b)
    end
  end

  def test_triangle_area_3d_success
    a = VectorAlgebra::Vector3D.new(1, 0, 0)
    b = VectorAlgebra::Vector3D.new(0, 1, 0)

    assert_equal 0.5, VectorAlgebra::Geometry.triangle_area(a, b)
  end

  def test_triangle_area_2d_success
    a = VectorAlgebra::Vector2D.new(1, 2)
    b = VectorAlgebra::Vector2D.new(3, 4)

    assert_equal 1, VectorAlgebra::Geometry.triangle_area(a, b)
  end

  def test_triangle_area_dimension_error
    a = VectorAlgebra::Vector.new(1, 2, 3, 4)
    b = VectorAlgebra::Vector.new(5, 6, 7, 8)

    assert_raises(VectorAlgebra::DimensionError) do
      VectorAlgebra::Geometry.triangle_area(a, b)
    end
  end

  def test_parallelepiped_volume_success
    a = VectorAlgebra::Vector3D.new(1, 0, 0)
    b = VectorAlgebra::Vector3D.new(0, 1, 0)
    c = VectorAlgebra::Vector3D.new(0, 0, 1)

    assert_equal 1.0, VectorAlgebra::Geometry.parallelepiped_volume(a, b, c)
  end

  def test_parallelepiped_volume_dimension_error
    a = VectorAlgebra::Vector.new(1, 2)
    b = VectorAlgebra::Vector.new(3, 4)
    c = VectorAlgebra::Vector.new(5, 6)

    assert_raises(VectorAlgebra::DimensionError) do
      VectorAlgebra::Geometry.parallelepiped_volume(a, b, c)
    end
  end

  def test_distance_point_to_line_success
    point = VectorAlgebra::Vector3D.new(1, 1, 0)
    line_point = VectorAlgebra::Vector3D.new(0, 0, 0)
    direction = VectorAlgebra::Vector3D.new(1, 0, 0)

    # расстояние до оси X = 1
    assert_equal 1.0, VectorAlgebra::Geometry.distance_point_to_line(point, line_point, direction)
  end

  def test_distance_point_to_line_zero_direction
    point = VectorAlgebra::Vector3D.new(1, 1, 1)
    line_point = VectorAlgebra::Vector3D.new(0, 0, 0)
    direction = VectorAlgebra::Vector3D.new(0, 0, 0)

    assert_raises(VectorAlgebra::ZeroVectorError) do
      VectorAlgebra::Geometry.distance_point_to_line(point, line_point, direction)
    end
  end

  def test_distance_point_to_plane_success
    point = VectorAlgebra::Vector3D.new(0, 0, 5)
    plane_point = VectorAlgebra::Vector3D.new(0, 0, 0)
    normal = VectorAlgebra::Vector3D.new(0, 0, 1)

    assert_equal 5.0, VectorAlgebra::Geometry.distance_point_to_plane(point, plane_point, normal)
  end

  def test_distance_point_to_plane_zero_normal
    point = VectorAlgebra::Vector3D.new(1, 1, 1)
    plane_point = VectorAlgebra::Vector3D.new(0, 0, 0)
    normal = VectorAlgebra::Vector3D.new(0, 0, 0)

    assert_raises(VectorAlgebra::ZeroVectorError) do
      VectorAlgebra::Geometry.distance_point_to_plane(point, plane_point, normal)
    end
  end
end
