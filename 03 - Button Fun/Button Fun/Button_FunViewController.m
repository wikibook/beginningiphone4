#import "Button_FunViewController.h"

@implementation Button_FunViewController
@synthesize statusText;

- (IBAction)buttonPressed:(id)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *newText = [[NSString alloc] initWithFormat:
                         @"%@ button pressed.", title];
    statusText.text = newText;
    [newText release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // 상위 뷰가 없는 경우
    // 뷰를 릴리스한다.
    // 캐시 데이터 같은 핵심 데이터가 아닌 정보를 모두 릴리스한다.
}

- (void)viewDidUnload {
    // 메인 뷰의 참조 유지한 하위 뷰를 모두 릴리스한다.
    // e.g. self.myOutlet = nil;
    self.statusText = nil;
}

- (void)dealloc {
    [statusText release];
    [super dealloc];
}

@end
