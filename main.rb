require_relative "lib/vector_algebra"

include VectorAlgebra

puts "=== СОЗДАНИЕ ВЕКТОРОВ ==="
v1 = Vector3D.new(1, 2, 3)
v2 = Vector3D.new(4, 5, 6)
v3 = Vector3D.new(0, 1, 0)

p v1.to_a
p v2.to_a

puts "\n=== БАЗОВЫЕ ОПЕРАЦИИ ==="
puts "v1 + v2 = #{(v1 + v2).to_a}"
puts "v1 - v2 = #{(v1 - v2).to_a}"
puts "v1 * 2 = #{(v1 * 2).to_a}"

puts "\n=== СКАЛЯРНОЕ ПРОИЗВЕДЕНИЕ ==="
puts "v1 · v2 = #{v1.dot(v2)}"

puts "\n=== НОРМА ==="
puts "|v1| = #{v1.norm}"

puts "\n=== НОРМАЛИЗАЦИЯ ==="
puts "v1 normalized = #{v1.normalize.to_a}"

puts "\n=== УГОЛ МЕЖДУ ВЕКТОРАМИ ==="
puts "angle(v1, v2) = #{v1.angle_with(v2)}"

puts "\n=== ПРОВЕРКИ ==="
puts "v1 || v2 (parallel?) = #{v1.parallel?(v2)}"
puts "v1 ⟂ v3 (orthogonal?) = #{v1.orthogonal?(v3)}"

puts "\n=== ВЕКТОРНОЕ ПРОИЗВЕДЕНИЕ ==="
puts "v1 × v2 = #{v1.cross(v2).to_a}"

puts "\n=== ГЕОМЕТРИЯ ==="

a = Vector3D.new(1, 0, 0)
b = Vector3D.new(0, 1, 0)
c = Vector3D.new(0, 0, 1)

puts "distance(v1, v2) = #{Geometry.distance(v1, v2)}"
puts "parallelogram area (a, b) = #{Geometry.parallelogram_area(a, b)}"
puts "triangle area (a, b) = #{Geometry.triangle_area(a, b)}"
puts "parallelepiped volume (a, b, c) = #{Geometry.parallelepiped_volume(a, b, c)}"

point = Vector3D.new(1, 1, 1)
line_point = Vector3D.new(0, 0, 0)
direction = Vector3D.new(1, 0, 0)

puts "distance point -> line = #{Geometry.distance_point_to_line(point, line_point, direction)}"

plane_point = Vector3D.new(0, 0, 0)
normal = Vector3D.new(0, 0, 1)

puts "distance point -> plane = #{Geometry.distance_point_to_plane(point, plane_point, normal)}"

puts "\n=== ВЕРСИЯ ГЕМА ==="
puts "Version: #{VectorAlgebra::VERSION}"