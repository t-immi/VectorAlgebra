module VectorAlgebra
  module Geometry

    # Расстояние между двумя точками
    def self.distance(a, b)
      (a - b).norm
    end

    # Площадь параллелограмма (через cross product)
    def self.parallelogram_area(a, b)
      raise DimensionError unless a.dimension == 3 && b.dimension == 3
      a.cross(b).norm
    end

    # Площадь треугольника
    def self.triangle_area(a, b)
      parallelogram_area(a, b) / 2.0
    end

    # Объём параллелепипеда (смешанное произведение)
    def self.parallelepiped_volume(a, b, c)
      raise DimensionError unless [a, b, c].all? { |v| v.dimension == 3 }
      a.dot(b.cross(c)).abs
    end

    # Расстояние от точки до прямой (в 3D)
    def self.distance_point_to_line(point, line_point, direction)
        ap = point - line_point

        ap3 = Vector3D.new(*ap.to_a)
        dir3 = Vector3D.new(*direction.to_a)

        cross = ap3.cross(dir3)
        cross.norm / dir3.norm
    end

    # Расстояние от точки до плоскости
    def self.distance_point_to_plane(point, plane_point, normal)
      ap = point - plane_point
      ap.dot(normal).abs / normal.norm
    end

  end
end