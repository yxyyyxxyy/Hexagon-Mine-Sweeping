package {

	import flash.display.MovieClip;


	public class game extends MovieClip {

		private var begin: Date, end: Date;

		private function showtime() {
			//not implemented
		}

		public function game() {
			stop();
		}

		public function win() {
			gotoAndStop(2);
			showtime();
		}

		public function fail() {
			gotoAndStop(3);
			showtime();
		}

		public function start() {
			begin = new Date();
		}


	}

}