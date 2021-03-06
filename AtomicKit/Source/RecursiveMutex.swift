/*******************************************************************************
 * The MIT License (MIT)
 * 
 * Copyright (c) 2017 Jean-David Gadina - www.xs-labs.com
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ******************************************************************************/

import Foundation

/**
 * Swift wrapper class for `pthread_mutex_t`.  
 * Note that this is a recursive version.
 * 
 * - seealso: Locakble
 */
public class RecursiveMutex: Lockable
{
    /**
     * `RecursiveMutex` errors.
     */
    public enum Error: Swift.Error
    {
        /**
         * Thrown when a failure occurs trying to initialize the native
         * mutex type.
         */
        case CannotCreateMutex
        
        /**
         * Thrown when a failure occurs trying to initialize the native
         * mutex attributes type.
         */
        case CannotCreateMutexAttributes
    }
    
    
    /**
     * Initializes a recursive mutex object.
     * 
     * - throws: `RecursiveMutex.Error` on failure.
     */
    public required init() throws
    {
        var attr = pthread_mutexattr_t()
        
        if( pthread_mutexattr_init( &attr ) != 0 )
        {
            throw Error.CannotCreateMutexAttributes
        }
        
        defer
        {
            pthread_mutexattr_destroy( &attr )
        }
        
        pthread_mutexattr_settype( &attr, PTHREAD_MUTEX_RECURSIVE )
        
        if( pthread_mutex_init( &( self._mutex ), &attr ) != 0 )
        {
            throw Error.CannotCreateMutex
        }
    }
    
    deinit
    {
        pthread_mutex_destroy( &( self._mutex ) )
    }
    
    /**
     * Locks the recursive mutex.
     */
    public func lock()
    {
        pthread_mutex_lock( &( self._mutex ) )
    }
    
    /**
     * Unlocks the recursive mutex.
     */
    public func unlock()
    {
        pthread_mutex_unlock( &( self._mutex ) )
    }
    
    /**
     * Tries to lock the recursive mutex.
     * 
     * - returns:   `true` if the recursive mutex was successfully locked, otherwise `false`.
     */
    public func tryLock() -> Bool
    {
        return pthread_mutex_trylock( &( self._mutex ) ) == 0
    }
    
    private var _mutex = pthread_mutex_t()
}

