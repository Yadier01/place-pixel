module main

import sdl

const width = 320
const height = 200

fn put_pixel(mut framebuffer []u32, x int, y int, color u32) {
	assert x >= 0 && x < width, 'x is out of bounds'
	assert y >= 0 && y < height, 'y is out of bounds'

	framebuffer[y * width + x] = color
}

fn main() {
	mut framebuffer := []u32{len: width * height}

	sdl.init(sdl.init_video)
	window := sdl.create_window(c'my window', width * 4, height * 4, unsafe { nil })
	renderer := sdl.create_renderer(window, unsafe { nil })
	texture := sdl.create_texture(renderer, sdl.PixelFormat.xrgb8888, sdl.TextureAccess.streaming,
		width, height)

	sdl.set_texture_scale_mode(texture, sdl.ScaleMode.nearest)
	defer {
		sdl.destroy_texture(texture)
		sdl.destroy_renderer(renderer)
		sdl.destroy_window(window)
		sdl.quit()
	}

	mut running := true

	for running {
		event := sdl.Event{}
		for sdl.poll_event(&event) {
			if event.type == .quit {
				running = false
				break
			}
		}

		put_pixel(mut &framebuffer, 319, 199, 0xFF0000)
		sdl.update_texture(texture, unsafe { nil }, framebuffer.data, width * 4)

		sdl.render_clear(renderer)
		sdl.render_texture(renderer, texture, unsafe { nil }, unsafe { nil })
		sdl.render_present(renderer)
	}
}
