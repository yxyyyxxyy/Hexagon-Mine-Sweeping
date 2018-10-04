package {
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.utils.setInterval;

	public class main extends MovieClip {

		private static const BOOMPERCENTAGE: Number = 0.2;
		private static const HEIGHT: Number = 14;
		private static const WIDTH: Number = 11;

		private var a: Array = new Array();

		private function check(i: int, j: int): void {
			var ii: int, jj: int, flag: int = 0;
			if (i < 0 || i >= WIDTH || j < 0 || j >= HEIGHT) return;
			if (a[i][j].BB == true || a[i][j].check == true) return;
			else {
				for (ii = i - 1; ii <= i + 1; ii++) {
					for (jj = j - 1; jj <= j + 1; jj++) {
						if (ii < 0 || ii >= WIDTH || jj < 0 || jj >= HEIGHT) continue;
						flag += int(a[ii][jj].BB);
					}
				}
				if (j - 2 >= 0 && a[i][j - 2].BB == true) flag++;
				if (j + 2 < HEIGHT && a[i][j + 2].BB == true) flag++;
				if (!flag) {
					a[i][j].ok();
					for (ii = i - 1; ii <= i + 1; ii++) {
						for (jj = j - 1; jj <= j + 1; jj++) {
							flag += check(ii, jj);
						}
					}
				} else a[i][j].become(flag);
			}
		}

		public function onClick(evt: MouseEvent): void {
			if (evt.currentTarget.BB == true) {
				for (var i: int = 0; i < WIDTH; i++) {
					for (var j: int = 0; j < HEIGHT; j++) {
						if (a[i][j].BB == true) a[i][j].boom();
					}
				}
				thegame.fail();
			} else {
				for (i = 0; i < WIDTH; i++) {
					for (j = 0; j < HEIGHT; j++) {
						if (a[i][j].name == evt.currentTarget.name) {
							var nn: int = 0;
							for (var ii = i - 1; ii <= i + 1; ii++) {
								for (var jj = j - 1; jj <= j + 1; jj++) {
									if (ii >= 0 && ii < WIDTH) {
										if (jj >= 0 && jj < HEIGHT) {
											if (a[ii][jj].BB == true) nn++;
										}
									}
								}
							}
							if (j - 2 >= 0 && a[i][j - 2].BB == true) nn++;
							if (j + 2 < HEIGHT && a[i][j + 2].BB == true) nn++;
							if (nn != 0) a[i][j].become(nn);
							else {
								check(i, j);
							}
						}
					}
				}

			}
		}

		public function restart(evt: MouseEvent) {
			evt.currentTarget.visible = false;
			trace(evt.currentTarget.name);
			for (var i: int = 0; i < WIDTH; i++) {
				for (var j: int = 0; j < HEIGHT; j++) {
					if (Math.random() < BOOMPERCENTAGE && (i + j) % 2 == 0) a[i][j].BB = true;
					else a[i][j].BB = false;
					a[i][j].resetSquare();
				}
			}

			thegame.start();
		}

		public function main() {
			thegame.start();
			setInterval(function (): void {
				var flllg: Boolean = true;
				for (var i: int = 0; i < WIDTH; i++)
					for (j = 0; j < HEIGHT; j++) {
						if (a[i][j].BB == true && a[i][j].clear == false) flllg = false;
						if (a[i][j].BB == false && a[i][j].clear == true) flllg = false;
					}
				if (flllg) thegame.win();
			}, 100);

			for (var i: int = 0; i < WIDTH; i++) {
				a[i] = new Array();
				for (var j: int = 0; j < HEIGHT; j++) {
					a[i][j] = new square;
					a[i][j].x = i * 50;
					a[i][j].y = j * 30;
					addChild(a[i][j]);
					if ((i + j) % 2) a[i][j].visible = false;
					a[i][j].addEventListener("click", onClick);
					a[i][j].addEventListener(MouseEvent.MOUSE_WHEEL, onWheel);
					if (Math.random() < BOOMPERCENTAGE && (i + j) % 2 == 0) a[i][j].BB = true;
					else a[i][j].BB = false;
				}
			}
		}

		public function onWheel(evt: MouseEvent): void {
			evt.currentTarget.removeEventListener(MouseEvent.MOUSE_WHEEL, onWheel);
			evt.currentTarget.addEventListener(MouseEvent.MOUSE_WHEEL, onDownWheel);
			evt.currentTarget.flag();
		}

		public function onDownWheel(evt: MouseEvent): void {
			evt.currentTarget.removeEventListener(MouseEvent.MOUSE_WHEEL, onDownWheel);
			evt.currentTarget.addEventListener(MouseEvent.MOUSE_WHEEL, onWheel);
			evt.currentTarget.unflag();
		}
	}
}