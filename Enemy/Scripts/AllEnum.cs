using Godot;
using System;

public partial class AllEnum
{
	/// <summary>
	/// 最大生命值的设置模式,用于<see cref="Enemy.SetMaxHealth(float, AllEnum.SetMaxHealthMode, AllEnum.SetCurrentHealthMode)"/>方法
	/// </summary>
	public enum SetMaxHealthMode{
		/// <summary>
        /// 直接设置最大生命值
        /// </summary>
		Set,
		/// <summary>
        /// 增加（或减少）最大生命值
        /// </summary>
		Add,
		/// <summary>
        /// 按照缩放比例来设置最大生命值
        /// </summary>
		Proportion,
	}

	/// <summary>
    /// 当前生命值的设置模式,用于<see cref="Enemy.SetMaxHealth(float, AllEnum.SetMaxHealthMode, AllEnum.SetCurrentHealthMode)"/>方法
    /// </summary>
	public enum SetCurrentHealthMode{
		/// <summary>
        /// 按照缩放比例来设置当前生命值
        /// </summary>
		Proportion,
		/// <summary>
        /// 不进行任何操作，但会检查当前生命值是否超过最大生命值
        /// </summary>
		NoAction,
		/// <summary>
        /// 同步设置当前生命值，你加多少我也加多少
        /// </summary>
		Sync,
	}

}
