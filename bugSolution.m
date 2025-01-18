The solution involves using `weak` references to break the retain cycle:

```objectivec
@interface MyClass : NSObject
@property (weak, nonatomic) AnotherClass *anotherObject; // Changed to weak
@end

@interface AnotherClass : NSObject
@property (weak, nonatomic) MyClass *myObject; // Changed to weak
@end

@implementation MyClass
// ...
@end

@implementation AnotherClass
// ...
@end

//In some part of your app:
MyClass *myInstance = [[MyClass alloc] init];
AnotherClass *anotherInstance = [[AnotherClass alloc] init];

myInstance.anotherObject = anotherInstance;
anotherInstance.myObject = myInstance; // Cycle broken by weak references

//Now, after use, the objects will deallocate normally
myInstance = nil; //Explicitly release to allow cleanup.
anotherInstance = nil; //Explicitly release to allow cleanup.
```

By declaring the properties as `weak`, the objects don't retain each other, thus allowing for proper memory management and preventing the crash.  Always carefully consider the lifecycle of your objects and use `weak` references when appropriate to avoid strong reference cycles.