//
//  MTLManagedObjectAdapter.swift
//  MTLManagedObjectAdapter
//
//  Created by Zachary Waldowski on 12/2/15.
//  Copyright © 2015. Some rights reserved. Licensed under MIT.
//

extension MTLManagedObjectAdapter {
	/// Attempts to deserialize an NSManagedObject into a Mantle model object.
	///
	/// - parameter type: The Mantle model class to return.
	/// - parameter fromManagedObject: The managed object to deserialize.
	public static func modelOfType<T: MTLManagedObjectSerializing>(type: T.Type = T.self, fromManagedObject managedObject: NSManagedObject) throws -> T {
		return try unsafeDowncast(__modelOfClass(type, fromManagedObject: managedObject))
	}

	/// Serializes a Mantle model into a managed object.
	///
	/// - parameter type: The managed object class to return.
	/// - parameter fromModel: The model object to serialize.
	/// - parameter insertingIntoContext: The context into which to insert the
	///   created managed object.
	public static func managedObjectOfType<T: NSManagedObject>(type: T.Type = T.self, fromModel model: MTLManagedObjectSerializing, insertingIntoContext context: NSManagedObjectContext) throws -> T {
		return try unsafeDowncast(__managedObjectFromModel(model, insertingIntoContext: context))
	}
}
