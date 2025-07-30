# UPLOAD system design
taskaia/

├── lib/

│   ├── core/                           
│   │   ├── animation/                 
│   │   │   ├── page_transitions.dart   
│   │   │   └── slide_transition_wrapper.dart 
│   │   │
│   │   ├── theme/                      
│   │   │   ├── app_colors.dart
│   │   │   ├── app_dimensions.dart
│   │   │   └── app_strings.dart
│   │   │
│   │   ├── utils/                      
│   │   │   └── responsive_utils.dart   
│   │   │
│   │   └── widgets/                    
│   │       ├── app_loading.dart        
│   │       ├── responsive_scaffold.dart 
│   │       ├── safe_area_wrapper.dart  
│   │       └── index.dart             
│   │

│   ├── data/                           
│   │   └── models/
│   │       └── product.dart             
│   │

│   └── presentation/    

│       └── features/                   
│           └── product/ 

│               ├── screens/            
│               │   └── product_details_screen.dart
│               └── widgets/            
│                   ├── product_card.dart
│                   ├── product_details_header.dart
│                   ├── product_details_content.dart
│                   ├── product_details_actions.dart
│                   ├── product_rating_widget.dart
│                   └── reusable_product_image.dart
