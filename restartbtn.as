package {

	import flash.display.MovieClip;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;

	public class restartbtn extends MovieClip {


		public function restartbtn() {
			gotoAndStop(2);
			this.addEventListener(MouseEvent.CLICK, (root as MovieClip).restart);
		}

		public function showbtn(): void {
			//主时间轴2帧，只需要remove

			//(parent as DisplayObjectContainer).setChildIndex((parent as MovieClip).restart_btn, (parent as DisplayObjectContainer).numChildren - 1);
			(parent as DisplayObjectContainer).removeChild(this);
			//(parent as DisplayObjectContainer).addChildAt(this, (parent as DisplayObjectContainer).numChildren - 1);
			//this.visible = false;			
			//this.visible = true;
			//(parent as DisplayObjectContainer).addChild(this);
		}

	}

}