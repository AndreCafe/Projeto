unit cxTreeListFeaturesDemoStrConsts;

interface

type
  TdxDescriptionInfo = record
    ID: Integer;
    Description: string;
  end;

const
  DescriptionsInfo: array[0..23] of TdxDescriptionInfo =
  ((ID: 0; Description: 'Nested bands allow users to build a hierarchical band structure. Bands can be moved within a hierarchy using drag and drop. This automatically affects all child bands and their columns.'),
   (ID: 1; Description: 'A band that displays node expand buttons is called an expandable band. In this example, you can specify the expandable band to customize the location of expand buttons.'),
   (ID: 2; Description: 'You can easily customize the visibility of bands and columns by clicking corresponding items in specially designed dropdowns. To invoke dropdowns, click the buttons located at the intersection of a band/column header panel and the node indicator.'),
   (ID: 3; Description: 'You can anchor any band to the left or right side of the ExpressQuantumTreeList so that a band doesn''t take part in horizontal scrolling. This example shows four anchored bands.'),
   (ID: 4; Description: 'This example shows how to calculate summaries against groups of nodes with the same parent. Use the group footer context menu to specify the summary types to be calculated, and adjust summary options.'),
   (ID: 5; Description: 'This example shows how to display multiple summaries per column in the footer and group footers. Use the footer and group footer context menus to specify the summary types to be calculated and adjust summary options.'),
   (ID: 6; Description: 'In this example, you can opt to include all child nodes for the summary calculation base or calculate, using only the immediate child nodes.'),
   (ID: 7; Description: 'In this example, node images are substituted on the fly with larger versions. You can specify at which node nesting level this should be done.'),
   (ID: 8; Description: 'This example shows how to display overlay images over node and state images. You can opt to display state images only for the focused node.'),
   (ID: 9; Description: 'Use spin editors to customize the height of individual nodes or specify the node height for all nodes. You can also drag the bottom edges of indicator cells to adjust the height of corresponding nodes.'),
   (ID:10; Description: 'This example shows how to filter nodes by changing their visibility. Nodes that don''t match the specified criteria are hidden.'),
   (ID:11; Description: 'Click node check boxes and radio buttons, to select the products to be "installed". See how a parent node keeps track of child node states, and automatically updates its state, and vice versa.'),
   (ID:12; Description: 'In this example, you can invoke context menus by right-clicking column headers, footer, group footers, or their cells. You can also disable context menus for certain elements.'),
   (ID:13; Description: 'See how fast the ExpressQuantumTreeList works in Virtual mode - when data is created and updated on the fly, using specially designed events. If the "Smart Load Mode" option is enabled, data is loaded on demand, when' + ' a node is expanded. Note the performance difference with this option on and off.'),
   (ID:14; Description: 'This example shows how to perform a text search in the tree list using various search modes and options.'),
   (ID:28; Description: 'In this example, the unbound tree list is dynamically populated with file system data. You can use an incremental search within the Name column to locate a certain folder or file.'),
   (ID:22; Description: 'This example demonstrates the tree list in provider mode. In this mode, a custom data source is created in code. Try the "Smart Load Mode" option that switches the data loading mode. If enabled, data is loaded on demand,' +' when a node is expanded. Note the performance difference with this option on and off.'),
   (ID:27; Description: 'In this example, you can switch the visibility of the preview section and customize its position within a node. You can also select a source column providing data for preview cells.'),
   (ID:21; Description: 'Nodes can be moved via drag and drop. While dragging, you can automatically expand a node by hovering the mouse pointer over the node''s expand button. Similarly, you can copy nodes by dragging them while holding down the Ctrl key.' + ' Note that multiple nodes can be selected using the Ctrl and Shift keys and dragged simultaneously.'),
   (ID:23; Description: 'This example shows how INI files can be easily edited using the unbound tree list.'),
   (ID:24; Description: 'The ExpressEditors Library shipped with the ExpressQuantumTreeList allows you to use about 30 editors for in-place data editing. You can create in-place editors as repository items and reuse them in other columns or tree lists.'),
   (ID:25; Description: 'Any tree list element can be custom painted using specially designed events. In this example, you can select an element within the Draw Item list and adjust the parameters of the routine that paints this element.'),
   (ID:26; Description: 'The appearance of tree list elements can be easily customized using styles. You can apply an entire palette of styles to all elements at one time via style sheets. This example allows you to apply predefined style sheets to the tree list.'),
   (ID:54; Description: 'This demo shows how to validate data input in-place using the built-in validation capabilities. Edit cell values and move focus or press the Enter key in order to validate the input. Correct input errors based on the ' + 'requirements displayed in error hints. Try various validation options to customize validation error display.'));


implementation

end.
