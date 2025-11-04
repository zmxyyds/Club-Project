using Godot;
using System;

public partial class AllEnum
{
	/// <summary>
	/// 最大生命值的设置模式,用于<see cref="Health.SetMaxHealth(float, AllEnum.SetMaxHealthMode, AllEnum.SetCurrentHealthMode)"/>方法
	/// </summary>
	public enum SetMaxHealthMode:byte
	{
		/// <summary>
        /// 直接设置最大生命值
        /// </summary>
		Set = 0,
		/// <summary>
        /// 增加（或减少）最大生命值
        /// </summary>
		Add = 1,
		/// <summary>
        /// 按照缩放比例来设置最大生命值
        /// </summary>
		Proportion = 2,
	}

	/// <summary>
    /// 当前生命值的设置模式,用于<see cref="Health.SetMaxHealth(float, AllEnum.SetMaxHealthMode, AllEnum.SetCurrentHealthMode)"/>方法
    /// </summary>
	public enum SetCurrentHealthMode:byte
	{
		/// <summary>
        /// 按照缩放比例来设置当前生命值
        /// </summary>
		Proportion = 0,
		/// <summary>
        /// 不进行任何操作，但会检查当前生命值是否超过最大生命值
        /// </summary>
		NoAction = 1,
		/// <summary>
        /// 同步设置当前生命值，你加多少我也加多少
        /// </summary>
		Sync = 2,
	}

}
