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

import XCTest
import AtomicKit

class DispatchedBoolTest: XCTestCase
{
    var _helper: DispatchedValueTestHelper< DispatchedBool, Bool >?
    
    override func setUp()
    {
        super.setUp()
        
        self._helper = DispatchedValueTestHelper( defaultValue: false, testCase: self )
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testGetSet_MainQueue()
    {
        self._helper!.testGetSet_MainQueue( value: true, notValue: false )
    }
    
    func testGetSet_GlobalQueue()
    {
        self._helper!.testGetSet_GlobalQueue( value: true, notValue: false )
    }
        
    func testGetSet_CustomQueue()
    {
        self._helper!.testGetSet_CustomQueue( value: true, notValue: false )
    }
    
    func testExecute_NoReturn_MainQueue()
    {
        self._helper!.testExecute_NoReturn_MainQueue( value: true, notValue: false )
    }
    
    func testExecute_NoReturn_GlobalQueue()
    {
        self._helper!.testExecute_NoReturn_GlobalQueue( value: true, notValue: false )
    }
    
    func testExecute_NoReturn_CustomQueue()
    {
        self._helper!.testExecute_NoReturn_CustomQueue( value: true, notValue: false )
    }
    
    func testExecute_Return_MainQueue()
    {
        self._helper!.testExecute_Return_MainQueue( value: true, notValue: false )
    }
    
    func testExecute_Return_GlobalQueue()
    {
        self._helper!.testExecute_Return_GlobalQueue( value: true, notValue: false )
    }
    
    func testExecute_Return_CustomQueue()
    {
        self._helper!.testExecute_Return_CustomQueue( value: true, notValue: false )
    }
}
