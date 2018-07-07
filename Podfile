# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'anotherTodo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'TextFieldEffects'
  pod 'DateTimePicker'
  pod 'IQKeyboardManagerSwift'
  target 'anotherTodoTests' do
    inherit! :search_paths
    testing_pods
  end

end
