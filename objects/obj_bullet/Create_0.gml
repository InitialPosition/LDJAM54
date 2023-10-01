
part = particles_bullet()

system = part_system_create()
emit = part_emitter_create(system)

part_emitter_region(system, emit, x + 1, x+3, y+1, y+3, ps_shape_rectangle, ps_distr_linear)

part_emitter_stream(system, emit, part, -2)