module VectorAlgebra
  class Vector2D < Vector
    def initialize(x, y)
      super(x, y)
    end

    def x
      self[0]
    end

    def y
      self[1]
    end
  end
end