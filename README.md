### 100 mini projects

This project contains a collection of small UI experiments. 

**Purpose:** Mainly to practice building UI components. E.g.: an animated stretchy header or a twitter like splash screen. I also want to build UI with different technologies/frameworks. E.g.: xibs, storyboards, manual layout, auto-layout (in code, xibs or storyboards) and to learn more about UIKit, Core Graphics and QuartzCore.

I'll list out and describe each mini project below with a short description of what I wanted to achieve and a technical explanation of how I achieved it (or not :-P).

Some extra notes:

- Only vanilla iOS will be used (e.g.: for programmatic contraints I will use the API that comes out the box and not depend on another framework like SnapKit). However, I will create and re-use extensions as I go along.

## View Hierarchy / Navigation
`AppDelegate`  
&nbsp;&nbsp;↪️`UIWindow`  
&nbsp;&nbsp;&nbsp;&nbsp;↪️`UINavigationController`  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↪️`ProjectListViewController : UINavigationController`


## Projects

#### **Collection view with compact cells**

**What:** A view for housing the list of all the "mini projects". 

✅ All orientations  ✅ All devices  

Tech used:  
 
- xibs  
- auto layout with xibs  
- the rest is in code: This means the delegate + datasource is "hooked up" in code. 

Pros:

- Auto-layout visualized in xibs can sometimes be easier to understand and quick to setup for simplistic views. But this might not be the case for more complex views.

Cons:  

- Using xibs (or storyboards for that matter) means we lose control on when objects are instantiated. So we can only really register for cells on `viewDidLoad` as at that point we know the `collectionView!` property will exist. Accessing before that will likely result in a crash!
- Can't use `UINavigationController` or `UITableViewController` in xibs. These have to be created in code. I wanted the ProjectListViewController to the UINavigationController so the collection view + navigation controller was all in one place and in 1 xib. but unfortunetaly they have to be seperate. 

### **Stretchy Hero Header**

This is quite common in iOS apps now a days.

