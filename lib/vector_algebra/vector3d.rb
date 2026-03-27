module VectorAlgebra
  class Vector3D < Vector

    def initialize(x, y, z)
      super(x, y, z)
    end

    def cross(other, orientation: :right)
      check_dimension(other)
      result = Vector3D.new(
        y * other.z - z * other.y,
        z * other.x - x * other.z,
        x * other.y - y * other.x
      )

      orientation == :left ? result * -1 : result
    end

    def x; self[0]; end
    def y; self[1]; end
    def z; self[2]; end

  end
end