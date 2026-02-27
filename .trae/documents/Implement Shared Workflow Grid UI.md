# Implementation Plan for Shared Workflow Page with Freezed Models

## Overview
Build a workflow fork page that displays shared workflows in a grid UI, using freezed for model generation and referencing the plugin installation interface design.

## Steps

### 1. Create Shared Workflow Model with Freezed
- Create a new `SharedWorkflow` model in `workflow_models.dart` using freezed
- Include all fields from the API response: id, share_title, share_comment, share_user, share_uid, name, description, timer, trigger_type, event_type, event_conditions, actions, flows, context, date, count
- Add proper JSON key annotations and null safety

### 2. Update Workflow Controller
- Add a new method `loadSharedWorkflows()` to fetch shared workflows from the API endpoint
- Add a new method `forkWorkflow()` to fork a shared workflow
- Add new observable lists and states for shared workflows
- Handle loading state and errors for shared workflows

### 3. Create Shared Workflow Page
- Create a new `SharedWorkflowPage` widget
- Implement grid layout using `GridView.builder` similar to plugin list
- Create `_SharedWorkflowCard` widget for grid items, inspired by `PluginItemCard`
- Add search functionality
- Add pull-to-refresh functionality
- Handle empty state and error state
- Add load more functionality

### 4. Design Workflow Card
- Create a card design similar to plugin item card with dark/light sections
- Display workflow name, description, share user, and other relevant information
- Add a "Fork" button to each card

### 5. Add Navigation
- Add a tab or navigation option to switch between regular workflows and shared workflows
- Update the workflow page to include a tab bar or navigation mechanism

### 6. API Integration
- Implement API call to fetch shared workflows from `https://mploser.x.ddnsto.com/api/v1/workflow/shares`
- Implement API call to fork workflows using `https://mploser.x.ddnsto.com/api/v1/workflow/fork`
- Handle authentication and error cases

### 7. Testing
- Test API integration with the shared workflow endpoint
- Test grid display with different numbers of workflows
- Test fork functionality
- Test error handling and loading states
- Test navigation between regular and shared workflows

## Technical Details
- API Endpoint: `https://mploser.x.ddnsto.com/api/v1/workflow/shares` (GET)
- Fork Endpoint: `https://mploser.x.ddnsto.com/api/v1/workflow/fork` (POST)
- Authentication: Bearer token
- UI Layout: Grid view with cards (similar to plugin list)
- State Management: GetX (consistent with existing codebase)
- Model Generation: Freezed (consistent with existing codebase)

## Files to Modify
1. `lib/modules/workflow/models/workflow_models.dart` - Add SharedWorkflow model with freezed
2. `lib/modules/workflow/controllers/workflow_controller.dart` - Add shared workflow and fork methods
3. `lib/modules/workflow/pages/workflow_page.dart` - Update to include shared workflow tab
4. `lib/modules/workflow/pages/shared_workflow_page.dart` - Create new page for shared workflows
5. `lib/modules/workflow/widgets/shared_workflow_card.dart` - Create card widget for shared workflows