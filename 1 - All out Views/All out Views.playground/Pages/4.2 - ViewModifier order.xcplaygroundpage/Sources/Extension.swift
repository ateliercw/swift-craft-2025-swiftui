import SwiftUI

public extension View {
	
	func withHierarchyLoadingSpinner() -> some View {
		self
	}
	
	func isLoading(_ isLoading: Binding<Bool>) -> some View {
		self
	}
	
	func runInTerminalSection() -> some View {
		self
	}
}

@Observable
private final class LoadingHandler {
	
	/// `true` will determine the loading spinner to be displayed.
	var isLoading: Bool = false
}

public struct HierarchyLoadingSpinnerModifier: ViewModifier {
	
	/// Intermediates the setter propagation logic and the `LoadingModifier` needs.
	@State private var loadingHandler = LoadingHandler()
	
	public init() { }
	
	// MARK: - ViewModifier implementation.
	
	public func body(content: Content) -> some View {
		content
			.environment(loadingHandler)
	}
}

/// Extracts the `LoadingHandler` from the environment and modifies the value based
/// on the one passed in as parameter.
public struct IsLoadingModifier: ViewModifier {
	
	/// `true` if the loading spinner should be visible or not.
	public let isLoading: Bool
	
	/// Intermediates the setter propagation logic and the `LoadingModifier` needs.
    @Environment(LoadingHandler.self)
    private var loadingHandler
	
	// MARK: - Init.
	
	public init(isLoading: Bool) {
		self.isLoading = isLoading
	}
	
	// MARK: - ViewModifier
	
	public func body(content: Content) -> some View {
		content
            .onChange(of: isLoading) { _, newValue in
                loadingHandler.isLoading = newValue
            }
	}
}
