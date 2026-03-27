module VectorAlgebra
  class Vector
    attr_reader :components

    def initialize(*components)
      raise ArgumentError, "Empty vector" if components.empty?
      @components = components.map(&:to_f)
    end

    def dimension
      @components.size
    end

    def [](index)
      raise IndexError if index >= dimension
      @components[index]
    end

    def to_a
      @components
    end

    def +(other)
      check_dimension(other)
      Vector.new(*@components.zip(other.to_a).map { |a, b| a + b })
    end

    def -(other)
      check_dimension(other)
      Vector.new(*@components.zip(other.to_a).map { |a, b| a - b })
    end

    def *(scalar)
      Vector.new(*@components.map { |c| c * scalar })
    end

    def dot(other)
      check_dimension(other)
      @components.zip(other.to_a).sum { |a, b| a * b }
    end

    def norm
      Math.sqrt(dot(self))
    end

    def normalize
      raise ZeroVectorError if norm.zero?
      self * (1.0 / norm)
    end

    def angle_with(other)
      Math.acos(dot(other) / (norm * other.norm))
    end

    def project_onto(other)
      raise ZeroVectorError if other.dot(other).zero?
      coef = dot(other) / other.dot(other)
      other * coef
    end

    def parallel?(other)
      normalize.to_a == other.normalize.to_a
    end

    def orthogonal?(other)
      dot(other).zero?
    end

    private

    def check_dimension(other)
      unless dimension == other.dimension
        raise DimensionError, "Different dimensions"
      end
    end
  end
end