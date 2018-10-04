package {

	import flash.display.MovieClip;

	public class game extends MovieClip {

		private var begin: Date, end: Date;

		private function getTime(d: Date): Number {
			return d.hours * 3600 + d.minutes * 60 + d.seconds + d.milliseconds / 1000;
		}

		private function hidetime() {
			(parent as MovieClip).gtime.text = "";
		}

		private function showtime() {
			end = new Date();
			(parent as MovieClip).gtime.text = "用时： " + (getTime(end) - getTime(begin)).toFixed(2) + " s";
		}

		public function game() {
			stop();
		}

		public function win() {
			gotoAndStop(2);
			showtime();
			(parent as MovieClip).restart_btn.showbtn();
		}

		public function fail() {
			gotoAndStop(3);
			showtime();
			(parent as MovieClip).restart_btn.showbtn();
		}

		public function start() {
			gotoAndStop(1);
			hidetime();
			begin = new Date();
		}


	}

}