/// Represents different error conditions that occur in the Cairo VM.
pub const CairoVMError = error{
    /// Adding two relocatables is forbidden.
    AddRelocToRelocForbidden,
    /// Memory access is out of bounds.
    MemoryOutOfBounds,
    /// Multiplying with a relocatable is forbidden.
    MulRelocForbidden,
    /// TODO, Invalid memory address encountered.
    InvalidMemoryAddress,
    /// Failed to fetch instruction from VM during the instruction cycle.
    InstructionFetchingFailed,
    /// Error in converting the encoded instruction to a u64.
    InstructionEncodingError,
    /// Non Zero High Bit in Instruction
    InstructionNonZeroHighBit,
    /// TODO, this error type is never used. ResLogic constants parsing related?
    ParseResLogicError,
    /// Occurs when values of different types are subtracted.
    TypeMismatchNotFelt,
    /// Error encountered with a built-in runner.
    RunnerError,
    /// Occurs when the expected value is not a Relocatable,
    /// or when subtracting two relocatables with different segment indices.
    TypeMismatchNotRelocatable,
    /// Occurs when both built-in deductions and fallback deductions for the operands fail.
    FailedToComputeOperands,
    /// No destination register can be deduced for the given opcode.
    NoDst,
    /// Occurs when both built-in deductions and fallback deductions fail to deduce Op1.
    FailedToComputeOp1,
    /// Occurs when both built-in deductions and fallback deductions fail to deduce Op0.
    FailedToComputeOp0,
    /// Signifies that the execution run has not finished.
    RunNotFinished,
    /// Represents errors related to memory management and access within the Cairo VM.
    Memory,
    /// Res.UNCONSTRAINED cannot be used with Opcode.ASSERT_EQ
    UnconstrainedResAssertEq,
    /// Different result and destination operands values for Opcode.ASSERT_EQ
    DiffAssertValues,
    /// Cannot return ProgramJson Counter
    CantWriteReturnPc,
    /// Cannot return Frame Pointer
    CantWriteReturnFp,
    /// Inconsistent auto deduction
    InconsistentAutoDeduction,
    /// Invalid PC update
    InvalidPcUpdate,
    /// Invalid Op1 Reg
    InvalidOp1Reg,
    /// Invalid Instruction Encoding
    InvalidInstructionEncoding,
    /// Invalid Res Logic
    InvalidResLogic,
    /// Invalid Ap Update
    InvalidApUpdate,
    /// Invalid Opcode
    InvalidOpcode,
    /// Unexpected Failure
    Unexpected,
};

/// Represents different error conditions that are memory-related.
pub const MemoryError = error{
    /// Occurs when the ratio of the builtin operation does not divide evenly into the current VM steps.
    ErrorCalculatingMemoryUnits,
    /// The amount of used cells associated with the Range Check runner is not available.
    MissingSegmentUsedSizes,
    /// The address is not in the temporary segment.
    AddressNotInTemporarySegment,
    /// Non-zero offset when it's not expected.
    NonZeroOffset,
    /// Duplicated relocation entry found.
    DuplicatedRelocation,
    /// Segment not allocated
    UnallocatedSegment,
    /// Temporary segment found while relocating (flattening) segment
    TemporarySegmentInRelocation,
    /// Inconsistent Relocation
    Relocation,
    /// Gap in memory range
    GetRangeMemoryGap,
    /// Math error
    Math,
    /// Represents errors related to unrelocated memory segments and associated operations.
    UnrelocatedMemory,
    /// Represents errors related to malformed or inconsistent public memory segments.
    MalformedPublicMemory,
    /// Represents a situation where a segment has more accessed addresses than its size.
    SegmentHasMoreAccessedAddressesThanSize,
    /// Represents an error when there's a failure to retrieve return values from memory.
    FailedToGetReturnValues,
    /// Range Check Number is out of bounds
    RangeCheckNumberOutOfBounds,
    /// Range Check found a non int
    RangecheckNonInt,
    /// Range Check get error
    RangeCheckGetError,
    /// Unknown memory cell
    UnknownMemoryCell,
    /// This memory cell doesn't contain an integer
    ExpectedInteger,
    /// This memory cell doesn't contain a relocatable value.
    ExpectedRelocatable,
    /// Error encountered during the WriteArg operation.
    WriteArg,
    /// Occurs if the VM's current step count is less than the minimum required steps for a builtin operation.
    InsufficientAllocatedCellsErrorMinStepNotReached,
    /// Invalid type encountered during the GenArg operation.
    GenArgInvalidType,
};

/// Represents the error conditions that are related to the `CairoRunner`.
pub const CairoRunnerError = error{
    // Raised when `end_run` hook of a runner is called more than once.
    EndRunAlreadyCalled,
    // Unable to convert provided layout to a valid layout.
    InvalidLayout,
};

/// Represents different error conditions that occur in the built-in runners.
pub const RunnerError = error{
    /// Errors associated with computing the address of a stop pointer of RangeCheckBuiltinRunner
    /// Raised when underflow occurs (i.e., subtracting 1 from 0),
    /// or when it fails to get a value for the computed address.
    NoStopPointer,
    /// Invalid stop pointer index occured in calculation of the final stack.
    /// Raised when the current vm step
    InvalidStopPointerIndex,
    /// Invalid stop pointer occured in calculation of the final stack.
    InvalidStopPointer,
    /// Raised when the conversion into a type of integer (e.g. a Felt) fails.
    BuiltinExpectedInteger,
    /// Could not convert the builtin into one of the layout's builtins.
    BuiltinNotInLayout,
    /// Integer value exceeds a power of two.
    IntegerBiggerThanPowerOfTwo,
    /// Memory-related errors in the built-in runners.
    Memory,
};

/// Represents different error conditions that occur during mathematical operations.
pub const MathError = error{
    /// Error when attempting to perform addition between Relocatable values.
    RelocatableAdd,
    /// Error when attempting to subtract a Relocatable from an integer value.
    SubRelocatableFromInt,
    /// Error when Relocatable offset is smaller than the integer value from which it is subtracted.
    RelocatableSubUsizeNegOffset,
    /// Value is too large to be coerced to a u64.
    ValueTooLarge,
    /// Error indicating subtraction with overflow.
    SubWithOverflow,
    /// Error indicating that the addition operation on the Relocatable offset exceeds the maximum limit.
    RelocatableAdditionOffsetExceeded,
    /// Error indicating that a point is not on the elliptic curve.
    PointNotOnCurve,
    /// Cell is not output cell
    NotOutputCell,
    RelocatableMul,
};

/// Represents different error conditions that occur in trace relocation
pub const TraceError = error{
    /// Raised when tracing is disabled
    TraceNotEnabled,
    /// Raised when trace relocation has already been done.
    AlreadyRelocated,
    /// Raised when the relocation table doesn't contain the first two segments
    NoRelocationFound,
    /// Raised when trying to get relocated trace when trace hasn't been relocated
    TraceNotRelocated,
};

/// Represents errors occurring during program execution.
pub const ProgramError = error{
    /// I/O errors
    IO,
    /// Errors in JSON parsing
    Parse,
    /// Indicates that the specified entrypoint was not found
    EntrypointNotFound,
    /// Indicates that a constant lacks a value
    ConstWithoutValue,
    /// Indicates a deviation from an expected prime value
    PrimeDiffers,
    /// Indicates the inability to build a StrippedProgram due to the absence of a main program entry
    StrippedProgramNoMain,
    /// Indicates an invalid hint PC value greater than or equal to the program length
    InvalidHintPc,
    /// Indicates an unsupported or unimplemented builtin encountered within the program.
    UnsupportedBuiltin,
    EmptyVecAlreadyFiltered,
};
