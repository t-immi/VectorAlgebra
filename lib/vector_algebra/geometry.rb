module VectorAlgebra
  module Geometry

    # Расстояние между двумя точками
    def self.distance(a, b)
      (a - b).norm
    end

    # Площадь параллелограмма (в 2D и 3D)
    def self.parallelogram_area(a, b)
      if a.dimension == 2 && b.dimension == 2
        x1, y1 = a.to_a
        x2, y2 = b.to_a
        (x1 * y2 - x2 * y1).abs

      elsif a.dimension == 3 && b.dimension == 3
        a.cross(b).norm

      else
        raise DimensionError, "Only 2D or 3D vectors supported"
      end
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
      raise ZeroVectorError if direction.norm.zero?
      ap = point - line_point

      ap3 = Vector3D.new(*ap.to_a)
      dir3 = Vector3D.new(*direction.to_a)

      cross = ap3.cross(dir3)
      cross.norm / dir3.norm
    end

    # Расстояние от точки до плоскости
    def self.distance_point_to_plane(point, plane_point, normal)
      raise ZeroVectorError if normal.norm.zero?
      ap = point - plane_point
      ap.dot(normal).abs / normal.norm
    end

  end
end