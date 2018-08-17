//
//  PlatformXmlParser.m
//  MapTools
//
//  Created by zhangzb on 2018/8/15.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "PlatformXmlParser.h"
#import "Platfrom.h"
@interface PlatformXmlParser()<NSXMLParserDelegate>
@property (nonatomic) NSMutableArray *array;
@end

@implementation PlatformXmlParser

- (instancetype)init{
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSMutableArray *)parser{
    //binding delegate
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Config" ofType:@"map.xml"];
    NSURL *url = [[NSURL alloc]initFileURLWithPath:filePath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc]initWithContentsOfURL:url];
    xmlParser.delegate = self;
    //解析
    [xmlParser parse];
    return _array;
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    //解析xml
    if ([elementName isEqualToString:@"platform"]) {
        NSString *mapId = attributeDict[@"id"];
        NSString *appKey = attributeDict[@"appKey"];
        NSString *factoryName = attributeDict[@"factoryName"];
        NSString *isOpen = attributeDict[@"isOpen"];
        Platfrom *platform = [[Platfrom alloc]init];
        platform.mapId = mapId;
        platform.appkey = appKey;
        platform.factoryName = factoryName;
        platform.isOpen = isOpen;
        [_array addObject:platform];
    }
    
    
    
}


@end
