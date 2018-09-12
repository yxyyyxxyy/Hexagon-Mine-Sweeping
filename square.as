package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class square extends MovieClip {

		public var BB: Boolean;
		public var check: Boolean;
		public var clear: Boolean = false;

		private function stat() {
			this.clear = false;
			this.removeEventListener(MouseEvent.MOUSE_WHEEL, (parent as MovieClip).onWheel);
			this.removeEventListener(MouseEvent.CLICK, (parent as MovieClip).onClick);
		}

		public function square() {
			stop();
		}

		public function boom(): void {
			gotoAndStop(2);
		}
		public function flag(): void {
			clear = true;
			gotoAndStop(3);
		}

		public function unflag(): void {
			clear = false;
			gotoAndStop(1);
		}
		public function become(n: int): void {
			gotoAndStop(4);
			num.text = n.toString();
			stat();
		}
		public function ok(): void {
			gotoAndStop(5);
			check = true;
			stat();
		}
	}

}