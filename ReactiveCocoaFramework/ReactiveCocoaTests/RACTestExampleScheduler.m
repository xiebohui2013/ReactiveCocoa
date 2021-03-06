//
//  RACTestExampleScheduler.m
//  ReactiveCocoa
//
//  Created by Josh Abernathy on 6/7/13.
//  Copyright (c) 2013 GitHub, Inc. All rights reserved.
//

#import "RACTestExampleScheduler.h"
#import "RACQueueScheduler+Subclass.h"

@implementation RACTestExampleScheduler

#pragma mark Lifecycle

- (id)initWithQueue:(dispatch_queue_t)queue {
	return [super initWithName:nil queue:queue];
}

#pragma mark RACScheduler

- (RACDisposable *)schedule:(void (^)(void))block {
	dispatch_async(self.queue, ^{
		[self performAsCurrentScheduler:block];
	});

	return nil;
}

- (RACDisposable *)after:(dispatch_time_t)when schedule:(void (^)(void))block {
	dispatch_after(when, self.queue, ^{
		[self performAsCurrentScheduler:block];
	});

	return nil;
}

@end
